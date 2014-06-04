// Description: Operator Precedence Chart in JavaScript

// +----------------------------------------------------------------------------------------+
// |    Priority    Operator        Operation                               Associativity   |
// +----------------------------------------------------------------------------------------+
// |    1           .               member                                  left-to-right   |
// |                []                                                                      |
// |                new             new                                     right-to-left   |
// |                                                                                        |
// |    2           ()              function call                           left-to-right   |
// |                                                                                        |
// |    3           ++              prefix or postfix increment                             |
// |                --              prefix or postfix decrement                             |
// |                                                                                        |
// |    4           !               boolean (logical) NOT                   right-to-left   |
// |                ~               bitwise NOT                                             |
// |                + -             unary plus, unary minus                                 |
// |                typeof          typeof                                                  |
// |                void            void                                                    |
// |                delete          delete                                                  |
// |                                                                                        |
// |    5           * / %           multiplication, division, modulus       left to right   |
// |                                                                                        |
// |    6           + -             addition, substraction                  left to right   |
// |                +               string concatenation                                    |
// |                                                                                        |
// |    7           <<              signed bit shift left                   left to right   |
// |                >>              signed bit shift right                                  |
// |                >>>             unsigned bit shift right                                |
// |                                                                                        |
// |    8           < <=            less than, less than or equal to        left to right   |
// |                > >=            greater than, greater than or equal to                  |
// |                in              in                                                      |
// |                instanceof      reference test                                          |
// |                                                                                        |
// |    9           ==              equal to                                left to right   |
// |                !=              not equal to                                            |
// |                ===             strict equal to                                         |
// |                !==             strict not equal to                                     |
// |                                                                                        |
// |    10          &               bitwise AND                             left-to-right   |
// |                                                                                        |
// |    11          ^               bitwise XOR                             left-to-right   |
// |                                                                                        |
// |    12          |               bitwise OR                              left-to-right   |
// |                                                                                        |
// |    13          &&              boolean (logical) AND                   left-to-right   |
// |                                                                                        |
// |    14          ||              boolean (logical) OR                    left-to-right   |
// |                                                                                        |
// |    15          ? :             conditional                             right to left   |
// |                                                                                        |
// |    16          yield           yield                                   right to left   |
// |                                                                                        |
// |    17          =               assignment                              right to right  |
// |                *= /= += -= %=  combinated assignment                                   |
// |                <<= >>= >>>=    (operation & assignment)                                |
// |                &= ^= |=                                                                |
// |                                                                                        |
// |    18          ,               comma                                   left-to-right   |
// +----------------------------------------------------------------------------------------+
