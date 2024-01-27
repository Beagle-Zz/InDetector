contract c13161{
//@dev ERC 721 safeTransfer from functions
    function safeTransferFrom(address _from, address _to, uint _pixelId) public canManageAndTransfer(_pixelId){
        safeTransferFrom(_from,_to,_pixelId,"");
    }
}