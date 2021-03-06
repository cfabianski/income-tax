describe IncomeTax::Countries::SaintPierreAndMiquelon do
  subject(:result) { described_class.new(income: income, income_type: type) }
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(5, 252)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9801.5".to_d                }
    its(:taxes)        { should be == "198.5".to_d                 }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(187, 454)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "58811.5".to_d               }
    its(:taxes)        { should be == "41188.5".to_d               }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(193, 351)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "45013811.5".to_d            }
    its(:taxes)        { should be == "54986188.5".to_d            }
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(6, 263)             }
    its(:gross_income) { should be == "10233.5294117647059".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "233.529411764705882".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(227, 475)           }
    its(:gross_income) { should be == 191530                       }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == 91530                        }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(391, 711)           }
    its(:gross_income) { should be == 222191530                    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == 122191530                    }
  end
end
