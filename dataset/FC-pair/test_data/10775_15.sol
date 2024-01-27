contract c10775{
    /* to allow upgrades of InterestEarnedAccount and AugmintReserves contracts. */
    function setSystemContracts(InterestEarnedAccount newInterestEarnedAccount, AugmintReserves newAugmintReserves)
    external restrict("StabilityBoard") {
        interestEarnedAccount = newInterestEarnedAccount;
        augmintReserves = newAugmintReserves;
        emit SystemContractsChanged(newInterestEarnedAccount, newAugmintReserves);
    }
}