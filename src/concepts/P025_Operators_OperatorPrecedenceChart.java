package concepts;

/*
 * Description: Operator Precedence Chart in Java
 *
 *  +----------------------------------------------------------------------------------------+
 *  |   Priority    Operator        Operation                               Associativity    |
 *  +----------------------------------------------------------------------------------------+
 *  |   1           [ ]             array index                             left to right    |
 *  |               ()              method call                                              |
 *  |               .               member access                                            |
 *  |   2           ++              pre- or postfix increment               right to left    |
 *  |               --              pre- or postfix decrement                                |
 *  |               + -             unary plus, minus                                        |
 *  |               ~               bitwise NOT                                              |
 *  |               !               boolean (logical) NOT                                    |
 *  |               (type)          type cast                                                |
 *  |               new             object creation                                          |
 *  |   3           * / %           multiplication, division, remainder     left to right    |
 *  |   4           + -             addition, subtraction                   left to right    |
 *  |               +               string concatenation                                     |
 *  |   5           <<              signed bit shift left                   left to right    |
 *  |               >>              signed bit shift right                                   |
 *  |               >>>             unsigned bit shift right                                 |
 *  |   6           < <=            less than, less than or equal to        left to right    |
 *  |               > >=            greater than, greater than or equal to                   |
 *  |               instanceof      reference test                                           |
 *  |   7           ==              equal to                                left to right    |
 *  |               !=              not equal to                                             |
 *  |   8           &               bitwise AND                             left to right    |
 *  |               &               boolean (logical) AND                                    |
 *  |   9           ^               bitwise XOR                             left to right    |
 *  |               ^               boolean (logical) XOR                                    |
 *  |   10          |               bitwise OR                              left to right    |
 *  |               |               boolean (logical) OR                                     |
 *  |   11          &&              boolean (logical) AND                   left to right    |
 *  |   12          ||              boolean (logical) OR                    left to right    |
 *  |   13          ? :             conditional                             right to right   |
 *  |   14          =               assignment                              right to right   |
 *  |               *= /= += -= %=  combinated assignment                                    |
 *  |               <<= >>= >>>=    (operation and assignment)                               |
 *  |               &= ^= |=                                                                 |
 *  +----------------------------------------------------------------------------------------+
 */
public class P025_Operators_OperatorPrecedenceChart {

    public static void main(String args[]) {

        int result = 1 + 2 * 3;
        System.out.println(result);
    }
}