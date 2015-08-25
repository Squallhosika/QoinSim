currentPath=$(pwd)

echo "Starting to build QoinSim c++/python wrapper..."

cp -fr $currentPath/c++/QoinSim/src/* $currentPath/swig/src/

swig -c++ -python -o $currentPath/swig/src/qoinSim_wrap.cpp $currentPath/swig/qoinSim.i
g++ -fPIC -c $currentPath/swig/src/qoinSim_wrap.cpp -o $currentPath/swig/obj/Release/qoinSim_wrap.o -I/usr/include/python2.7/
cp -fr $currentPath/c++/QoinSim/obj/Release/src/* $currentPath/swig/obj/Release/
cd $currentPath/swig/obj/Release/
g++ -shared qoinSim_wrap.o Misc.o RandomUniformMT.o RandomUniformSobol.o RandomVarEnv.o RandomVarInt.o -o $currentPath/swig/bin/Release/_PyQoinSim.so
cp -fr $currentPath/swig/bin/Release/_PyQoinSim.so $currentPath/python/
cp -fr $currentPath/swig/src/PyQoinSim.py $currentPath/python/
