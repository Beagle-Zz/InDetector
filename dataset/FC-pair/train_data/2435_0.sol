contract c2435{
    // Schreibt dem Absender der Transaktion (TXfrom) ihren Wert (TXvalue) als Guthaben zu
    function einzahlen() public payable{
        guthaben[msg.sender] = msg.value;
    }
}