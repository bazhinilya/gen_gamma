puts "\n\n\n Предварительная настройка дизайна \n\n\n"
set FILE_NAME ./outputs/innovus.v
set TOP_CELL gen_gamma_decoder
set DIR_DEST innovus
set CORE_MARGIN_IO 30
set CORE_RATIO 1.0
set CORE_UTIL 0.7

puts "\n\n\n Инициализация файла Verilog-описания схемы \n\n\n"
set init_verilog $FILE_NAME

puts "\n\n\n Инициализация ячейки верхнего уровня \n\n\n"
set init_top_cell $TOP_CELL

puts "\n\n\n Инициализация файла входов/выходов \n\n\n"
set init_io_file gen_gamma_decoder.save.io

puts "\n\n\n Инициализация пути к mmmc-файлу \n\n\n"
set init_mmmc_file ./outputs/innovus.mmode.tcl

puts "\n\n\n Инициализация пути к lef-файлам \n\n\n"
set init_lef_file {\
./library/gsclib045_tech.lef \
./library/gsclib045_macro.lef \
./library/giolib045.lef}
puts "\n\n\n Инициализация проводов питания \n\n\n"
set init_pwr_net {VDDO VDDC}
set init_gnd_net {VSSO VSSC}

puts "\n\n\n Инициализация проекта \n\n\n"
init_design

puts "\n\n\n Высота/Ширина Использование_ядра Расстояние_до_границы_ядра_4_шт \n\n\n"
floorPlan -r $CORE_RATIO $CORE_UTIL $CORE_MARGIN_IO $CORE_MARGIN_IO $CORE_MARGIN_IO $CORE_MARGIN_IO
setFlipping s
planDesign

puts "\n\n\n Добавление филлеров к контактным площадкам (west, north, south, east) \n\n\n"
addIoFiller -cell padIORINGFEED10 -prefix FILLER -side w
addIoFiller -cell padIORINGFEED10 -prefix FILLER -side s
addIoFiller -cell padIORINGFEED1 -prefix FILLER -side w
addIoFiller -cell padIORINGFEED1 -prefix FILLER -side s

puts "\n\n\n Подключение глобальных сигналов питания к соответствующим пинам \n\n\n"
clearGlobalNets
globalNetConnect VDDC -type pgpin -pin VDD -instanceBaseName *
globalNetConnect VSSC -type pgpin -pin VSS -instanceBaseName *
globalNetConnect VDDO -type pgpin -pin VDDIOR -instanceBaseName *
globalNetConnect VSSO -type pgpin -pin VSSIOR -instanceBaseName *

puts "\n\n\n Добавление колец питания вокруг ядра\n\n\n"
addRing -nets {VDDC VSSC} -type core_rings -follow io -layer {top Metal3 bottom Metal3 left Metal2 right Metal2} -width 8 -spacing 1.5 -center 1
addStripe -nets {VDDC VSSC} -direction vertical -layer Metal2 -width 4 -spacing 2 -set_to_set_distance 30

puts "\n\n\n Добавление рельс питания к стандартным ячейкам \n\n\n"
setSrouteMode -viaConnectToShape {noshape}
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { Metal1 Metal11 } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { Metal1 Metal11 } -nets { VDDC VSSC } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { Metal1 Metal11 }

puts "\n\n\n Размещение стандартных ячеек с игнорированием скановых цепей\n\n\n"
setPlaceMode -fp false
setPlaceMode -place_global_exp_allow_missing_scan_chain true
setPlaceMode -place_global_place_io_pins true
place_design

puts "\n\n\n Создание клокового дерева \n\n\n"
setDelayCalMode -siAware false 
timeDesign -preCTS
report_timing > $DIR_DEST/$TOP_CELL/${TOP_CELL}_timing_pre.rpt
optDesign -preCTS
create_ccopt_clock_tree_spec
get_ccopt_clock_trees *
ccopt_design -cts
timeDesign -postCTS
report_timing > $DIR_DEST/$TOP_CELL/${TOP_CELL}_timing_post.rpt
optDesign -postCTS

puts "\n\n\n Оптимизация разводки \n\n\n"
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
timeDesign -postRoute
optDesign -postRoute

puts "\n\n\n Добавление филлеров в ядро \n\n\n"
setFillerMode -core {FILL64 FILL32 FILL16 FILL8 FILL4 FILL2 FILL1}
addFiller -markFixed

puts "\n\n\n Формирование отчётов \n\n\n"
report_power > $DIR_DEST/$TOP_CELL/${TOP_CELL}_power.rpt
report_area  > $DIR_DEST/$TOP_CELL/${TOP_CELL}_area.rpt

puts "\n\n\n Экспорт DEF-файла \n\n\n"
set dbgLefDefOutVersion 5.8
global dbgLefDefOutVersion
defOut -floorplan -netlist -routing top.def

puts "\n\n\n Экспорт GDSII файла \n\n\n"
streamOut $DIR_DEST/$TOP_CELL/$TOP_CELL.gds2

puts "\n\n\n Экспорт LEF-файла \n\n\n"
write_lef_abstract $DIR_DEST/$TOP_CELL/$TOP_CELL.lef

puts "\n\n\n Экспорт списка соедиений в формате Verilog \n\n\n"
saveNetlist -includePowerGround -excludeLeafCell $DIR_DEST/$TOP_CELL/${TOP_CELL}_netlist.v

puts "\n\n\n Сохранение дизайна \n\n\n"
saveDesign $DIR_DEST/$TOP_CELL/$TOP_CELL.enc

exit