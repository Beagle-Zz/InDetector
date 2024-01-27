contract c2385{
    /**
     * @dev Setup the map of bonus-rates (as a percentage) and total hardCap for each SaleState tier
     * to be called by the constructor.
     */
    function createSalesTierConfigMap() private {
        tierConfigs [keccak256(SaleState.Initial)] = TierConfig({
            stateName: "Initial",
            tierRatePercentage: 0,
            hardCap: 0
        });
        tierConfigs [keccak256(SaleState.PrivateSale)] = TierConfig({
            stateName: "PrivateSale",
            tierRatePercentage: 100,
            hardCap: SafeMath.mul(400000000, (10 ** 18))
        });
        tierConfigs [keccak256(SaleState.FinalisedPrivateSale)] = TierConfig({
            stateName: "FinalisedPrivateSale",
            tierRatePercentage: 0,
            hardCap: 0
        });
        tierConfigs [keccak256(SaleState.PreSale)] = TierConfig({
            stateName: "PreSale",
            tierRatePercentage: 140,
            hardCap: SafeMath.mul(180000000, (10 ** 18))
        });
        tierConfigs [keccak256(SaleState.FinalisedPreSale)] = TierConfig({
            stateName: "FinalisedPreSale",
            tierRatePercentage: 0,
            hardCap: 0
        });
        tierConfigs [keccak256(SaleState.PublicSaleTier1)] = TierConfig({
            stateName: "PublicSaleTier1",
            tierRatePercentage: 130,
            hardCap: SafeMath.mul(265000000, (10 ** 18))
        });
        tierConfigs [keccak256(SaleState.PublicSaleTier2)] = TierConfig({
            stateName: "PublicSaleTier2",
            tierRatePercentage: 120,
            hardCap: SafeMath.mul(330000000, (10 ** 18))
        });
        tierConfigs [keccak256(SaleState.PublicSaleTier3)] = TierConfig({
            stateName: "PublicSaleTier3",
            tierRatePercentage: 110,
            hardCap: SafeMath.mul(375000000, (10 ** 18))
        });
        tierConfigs [keccak256(SaleState.PublicSaleTier4)] = TierConfig({
            stateName: "PublicSaleTier4",
            tierRatePercentage: 100,
            hardCap: SafeMath.mul(400000000, (10 ** 18))
        });
        tierConfigs [keccak256(SaleState.FinalisedPublicSale)] = TierConfig({
            stateName: "FinalisedPublicSale",
            tierRatePercentage: 0,
            hardCap: 0
        });
        tierConfigs [keccak256(SaleState.Closed)] = TierConfig({
            stateName: "Closed",
            tierRatePercentage: 0,
            hardCap: SafeMath.mul(400000000, (10 ** 18))
        });
    }
}