contract c18474{
    // Allows anyone to sign up as an unofficial application
    function unofficialApplicationSignUp(string applicationName) public payable {
        require(bytes(applicationName).length < 100);
        require(msg.value >= unofficialApplicationSignUpFee);
        require(applicationName.allLower());
        HydroToken hydro = HydroToken(hydroTokenAddress);
        uint256 hydroBalance = hydro.balanceOf(msg.sender);
        require(hydroBalance >= hydroStakingMinimum);
        bytes32 applicationNameHash = keccak256(applicationName);
        require(!applicationNameHashTaken(applicationNameHash, false));
        unofficialApplicationDirectory[applicationNameHash] = Application(applicationName, false, true);
        emit ApplicationSignUp(applicationName, false);
    }
}