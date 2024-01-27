contract c40531{
     
     
    function abdicate() {
        if (msg.sender == madKing && msg.sender != trueGods) {
            madKing.send(kingBank);
            if (piggyBank > kingCost * 40 / 100) {
                madKing.send(kingCost * 40 / 100);
                piggyBank -= kingCost * 40 / 100;
            }
            else {
                madKing.send(piggyBank);
                piggyBank = 0;
            }
            madKing = trueGods;
            kingCost = 1 ether;
        }
    }
}