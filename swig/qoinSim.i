%module PyQoinSim
%{
#include "RandomVarInt.h"
%}

%include "std_string.i"
%include "std_vector.i"


namespace std{
  %template(VectorDouble) vector<double>;
  %template(VectorString) vector<string>;
}

using namespace std;

namespace QOINSIM {
class RandomVarInt{
  public:
    RandomVarInt();
    ~RandomVarInt();

  public:
    double getRandom(std::vector<std::string> p_args);
    std::vector<double> getRandom(std::vector<std::string> p_args, unsigned int p_size);
};
}
