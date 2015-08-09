#include "RandomVarEnv.h"
#include "RandomUniformMT.h"
#include "Misc.h"

namespace QOINSIM {

std::unique_ptr<Random>
RandomVarFactory::buildUnique(Random::ERandomVarType p_type){
  switch(p_type){
    case Random::E_UniformMT:
      return std::unique_ptr<Random>(new RandomUniformMT);
    default:
      throw "type not implemented";
  }
}

std::shared_ptr<Random>
RandomVarFactory::buildShared(Random::ERandomVarType p_type){
  switch(p_type){
    case Random::E_UniformMT:
      return std::shared_ptr<Random>(new RandomUniformMT);
    default:
      throw "type not implemented";
  }
}

double
RandomVarEnv::getRandom(std::string p_type){
  Random::ERandomVarType l_type = stringToType(p_type, s_typeMap);
  if (m_randomVars.find(l_type) == m_randomVars.end())
    m_randomVars[l_type] = RandomVarFactory::buildUnique(l_type);

  return m_randomVars[l_type]->gen();
}

double*
RandomVarEnv::getRandom(std::string p_type, unsigned int p_size){
  Random::ERandomVarType l_type = stringToType(p_type, s_typeMap);
  if (m_randomVars.find(l_type) == m_randomVars.end())
    m_randomVars[l_type] = RandomVarFactory::buildUnique(l_type);

  return &m_randomVars[l_type]->gen(p_size)[0];
}
}
