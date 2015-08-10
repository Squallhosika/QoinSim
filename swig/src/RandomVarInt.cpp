#include "RandomVarInt.h"
#include "RandomVarEnv.h"

namespace QOINSIM {
double
RandomVarInt::getRandom(char* p_type){
  RandomVarEnv& l_env = RandomVarEnv::instance();

  std::string l_type(p_type);
  return l_env.getRandom(l_type);
}
double*
RandomVarInt::getRandom(char* p_type, unsigned int p_size){
  RandomVarEnv& l_env = RandomVarEnv::instance();

  std::string l_type(p_type);
  return l_env.getRandom(l_type, p_size);
}
}
