contract c18474{
    // Allows the Hydro API to sign up official users with their app-generated address
    function officialUserSignUp(string userName, address userAddress) public onlyOwner {
        _userSignUp(userName, userAddress, true);
    }
}