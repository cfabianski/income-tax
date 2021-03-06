describe IncomeTax::Countries::UnitedStates::NewYork do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, state: 'New York') }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 900                          }
    its(:taxes)        { should be == 100                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(19, 174)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8908                         }
    its(:taxes)        { should be == 1092                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(43, 168)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "74404.65".to_d              }
    its(:taxes)        { should be == "25595.35".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(279, 577)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "51647342.665".to_d          }
    its(:taxes)        { should be == "48352657.335".to_d          }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == "1111.111111111111111".to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "111.111111111111111".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(7, 65)              }
    its(:gross_income) { should be == "11206.944444444444433".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1206.944444444444433".to_d  }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(134, 531)           }
    its(:gross_income) { should be == "133751.7926486341725".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "33751.7926486341725".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(136, 317)           }
    its(:gross_income) { should be == "175136803.55444583".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "75136803.55444583".to_d     }
  end
end
