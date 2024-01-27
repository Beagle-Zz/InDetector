contract c18474{
    // Allows the Hydro API to sign up official applications
    function officialApplicationSignUp(string applicationName) public onlyOwner {
        bytes32 applicationNameHash = keccak256(applicationName);
        require(!applicationNameHashTaken(applicationNameHash, true));
        officialApplicationDirectory[applicationNameHash] = Application(applicationName, true, true);
        emit ApplicationSignUp(applicationName, true);
    }
}