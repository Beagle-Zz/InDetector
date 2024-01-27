contract c2435{
   // Eine weitere Veranschaulichung eines Funktionstyps, der den state nicht ändert. 
    // Weil mit pure gekennzeichnete Funktionen auf den state sogar garnicht nicht zugreifen können,
    // werden entsprechende opcodes nicht benötigt und der smart contract kostet weniger Guthabens
    // beim deployment benötigt. 
    function addieren(uint _menge1, uint _menge2) pure returns (uint) {
        return _menge1 + _menge2;
    }
}