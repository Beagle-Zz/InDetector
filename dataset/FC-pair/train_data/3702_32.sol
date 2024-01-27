contract c3702{
    /**
    * @dev When the transfer function is run, 
    * there are two different types; transfer from superinvestors to investor and to non-investors. 
    * In the latter case, the non-investors will be investor and 10% of the initial amount will be allocated. 
    * And when investor operates the transfer function, the values will be limited by timelock.
    * @param _to address to send
    * @param _value tmtg's amount
    */
    function transfer(address _to, uint256 _value) public
    whenPermitted(msg.sender) whenPermitted(_to) whenNotPaused onlyNotBankOwner
    returns (bool) {   
        if(investorList[msg.sender]) {
            return _transferInvestor(_to, _value);
        } else {
            if (superInvestor[msg.sender]) {
                require(_to != owner);
                require(!superInvestor[_to]);
                require(!CEx[_to]);
                if(!investorList[_to]){
                    investorList[_to] = true;
                    searchInvestor[_to] = investor(0, _value, _value.div(10));
                    emit TMTG_SetInvestor(_to); 
                }
            }
            return super.transfer(_to, _value);
        }
    }
}