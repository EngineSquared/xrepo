cp -r templates/c++ ~/.xmake/templates/.
rm -rf template_cpp_project
xmake create -l c++ -t engine-squared template_cpp_project
xmake build -P template_cpp_project
xmake run -P template_cpp_project
xmake test -P template_cpp_project
