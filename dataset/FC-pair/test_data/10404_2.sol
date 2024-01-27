contract c10404{
	//Update the address of the data and logic layer
    function setBitSTD(address dataAddress,address logicAddressr) onlyOwner public{
        logic=BitSTDLogic(logicAddressr);
        logic.setData(dataAddress);
    }
}