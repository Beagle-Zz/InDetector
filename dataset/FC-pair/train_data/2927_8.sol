contract c2927{
    /**
    *@dev Method to add eligible addresses in the list of burners. Since we need to burn all tokens left with the sales contract after the sale has ended. The sales contract should
    * be an eligible burner. The owner has to add the sales address in the eligible burner list.
    * @param _burner Address of the eligible burner
    */
    function addEligibleBurner(address _burner)public onlyOwner {
        require(_burner != address(0));
        allowedBurners[_burner] = true;
        emit BurnerAdded(_burner);
    }
}