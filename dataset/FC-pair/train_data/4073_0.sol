contract c4073{
    /************************** */
    /*         LOGIC            */
    /************************** */
    //
    /****** PUBLIC READ */
    //get data relating to escrow
    function getEscrowData(uint i) view public returns (address, bool, address, bool, address, bool, uint){
        return (escrowLedger[i].sender.signee, escrowLedger[i].sender.hasSigned, 
        escrowLedger[i].recipient.signee, escrowLedger[i].recipient.hasSigned, 
        escrowLedger[i].witness.signee, escrowLedger[i].witness.hasSigned, 
        escrowLedger[i].blockNum);
    }
}