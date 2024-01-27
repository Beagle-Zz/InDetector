contract c13161{
    //@dev payout function to dev
    function payout(address _to) public onlyCEO {
        if (_to == address(0)) {
            ceoAddress.transfer(address(this).balance);
        } else {
            _to.transfer(address(this).balance);
        }  
    }
}