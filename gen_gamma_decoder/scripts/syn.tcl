puts "\n\n\n Указание выходной директории \n\n\n"
set OUTPUT_DIR ./outputs
set PROJECT ./rtl

puts "\n\n\n Задание имени модуля верхнего уровня \n\n\n"
set DESIGN gen_gamma_decoder

puts "\n\n\n Указание папки, в которой лежат lib- и lef-файлы \n\n\n"
set LIBRARY_LOCATION ./library

puts "\n\n\n Указание файла с временными ограничениями \n\n\n"
set CONSTRAINTS ./scripts/constraints.sdc

puts "\n\n\n Установка пути к библиотекам \n\n\n"
set_attribute init_lib_search_path $LIBRARY_LOCATION

puts "\n\n\n Поиск lib-файлов \n\n\n"
set LIBRARY_FILE_NAMES [glob -directory $LIBRARY_LOCATION *.lib]
set_attribute library $LIBRARY_FILE_NAMES

puts "\n\n\n Поиск lef-файлов \n\n\n"
set TLEF_FILE_NAMES [glob -directory $LIBRARY_LOCATION *.tlef]
set_attribute lef_library $TLEF_FILE_NAMES
set LEF_FILE_NAMES [glob -directory $LIBRARY_LOCATION *.lef]
set_attribute lef_library $LEF_FILE_NAMES

puts "\n\n\n Загрузка RTL-описания \n\n\n"
read_hdl -sv $PROJECT/$DESIGN.sv

puts "\n\n\n Подготовка дизайна \n\n\n"
elaborate

puts "\n\n\n Загрузка временных ограничений \n\n\n"
source $CONSTRAINTS

puts "\n\n\n Синтез на Verilog-примитивах \n\n\n"
syn_generic
write_hdl -generic > $OUTPUT_DIR/netlists/${DESIGN}_generic.v

puts "\n\n\n Синтез на целевой библиотеке \n\n\n"
syn_map
write_hdl > $OUTPUT_DIR/netlists/${DESIGN}_mapped.v

puts "\n\n\n Оптимизация синтеза на целевой библиотеке \n\n\n"
syn_opt
write_hdl > $OUTPUT_DIR/netlists/${DESIGN}_mapped_opt.v

puts "\n\n\n Экспорт SDC и SDF \n\n\n"
write_sdc > $OUTPUT_DIR/$DESIGN.sdc
write_sdf -version 2.1 > $OUTPUT_DIR/$DESIGN.sdf

puts "\n\n\n Запись отчётов \n\n\n"
report qor > $OUTPUT_DIR/reports/qor_$DESIGN.rpt
report area > $OUTPUT_DIR/reports/area_$DESIGN.rpt
report messages > $OUTPUT_DIR/reports/messages_$DESIGN.rpt
report gates > $OUTPUT_DIR/reports/gates_$DESIGN.rpt
report timing > $OUTPUT_DIR/reports/timing_$DESIGN.rpt
report power > $OUTPUT_DIR/reports/power_$DESIGN.rpt

puts "\n\n\n Запись результатов для Innovus \n\n\n"
write_design -innovus -base_name $OUTPUT_DIR/innovus

puts "The RUNTIME is [get_attribute real_runtime /]"
puts "The MEMORY USAGE is [get_attribute memory_usage /]"

exit