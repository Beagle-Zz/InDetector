contract c18474{
    // Allows the Hydro API to delete applications unilaterally
    function deleteApplication(string applicationName, bool official) public onlyOwner {
        bytes32 applicationNameHash = keccak256(applicationName);
        require(applicationNameHashTaken(applicationNameHash, official));
        if (official) {
            delete officialApplicationDirectory[applicationNameHash];
        } else {
            delete unofficialApplicationDirectory[applicationNameHash];
        }
        emit ApplicationDeleted(applicationName, official);
    }
}