contract c10746{
    /* private function used by transferAgreement & transfer */
    function _transfer(address from, address to) private {
        Agreement storage agreement = agreements[agreementOwners[from]];
        require(agreementOwners[from] != 0x0, "from agreement must exists");
        require(agreementOwners[to] == 0, "to must not have an agreement");
        require(to != 0x0, "must not transfer to 0x0");
        agreement.owner = to;
        agreementOwners[to] = agreementOwners[from];
        agreementOwners[from] = 0x0;
        emit Transfer(from, to, agreement.balance);
    }
}