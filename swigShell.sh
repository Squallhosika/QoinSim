currentPath=$(pwd)

echo "Starting to build QoinSim c++/python wrapper..."

cp -fr $currentPath/c++/QoinSim/src/headerForSwig.h $currentPath/swig/ 

swig -c++ -python -o $currentPath/swig/src/qoinSim_wrap.cpp $currentPath/swig/qoinSim.i
g++ -fPIC -c $currentPath/swig/src/qoinSim_wrap.cpp -o $currentPath/swig/obj/Release/qoinSim_wrap.o -I/usr/local/include/python2.7/
#cp -a -fr /c++/qoinSim/obj/Release/src/ /swig/obj/Release/
#cd /swig/obj/Release/
#g++ -shared qoinSim_wrap.o RandomUniformMT.o RandomVarEnv.o RandomVarInt.o -o qoinSim_wrap.so
