contract c13707{
    ///the function of adding to the balances
    function alottMainSaleToken(address[] arr) public {
        require(msg.sender == distributorAddress);
        for(uint i=0;i<arr.length;i++){
            if(checkExistsInArray(arr[i])){
            if(!balances[arr[i]].tokenstransferred){
                balances[arr[i]].tokenstransferred = true;
                token.addToBalances(arr[i], balances[arr[i]].value);
            }
        }
        }
    }
}