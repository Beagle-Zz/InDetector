contract c3702{
    /**
    * @dev If from is superinvestor in transforFrom, the function can’t be used because of limit in Approve. 
    * And if from is investor, the amount of coins to send is limited by timelock.
    * @param _from send amount from this address 
    * @param _to address to send
    * @param _value tmtg's amount
    */
    function transferFrom(address _from, address _to, uint256 _value)
    public whenNotPaused whenPermitted(_from) whenPermitted(_to) whenPermitted(msg.sender)
    returns (bool ret)
    {   
        if(investorList[_from]) {
            return _transferFromInvestor(_from, _to, _value);
        } else {
            ret = super.transferFrom(_from, _to, _value);
            emit TMTG_TransferFrom(_from, msg.sender, _to, _value);
        }
    }
}