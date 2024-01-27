contract c13161{
//MODIFIERS
//@dev access modifiers for ceo
    modifier onlyCEO() {
        require(msg.sender == ceoAddress);
        _;
    }
}