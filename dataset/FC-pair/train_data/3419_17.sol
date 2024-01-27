contract c3419{
    /// @notice Executes active investment and redemption requests, in a way that minimises information advantages of investor
    /// @dev Distributes melon and shares according to the request
    /// @param id Index of request to be executed
    /// @dev Active investment or redemption request executed
    function executeRequest(uint id)
        external
        pre_cond(!isShutDown)
        pre_cond(requests[id].status == RequestStatus.active)
        pre_cond(
            _totalSupply == 0 ||
            (
                now >= add(requests[id].timestamp, modules.pricefeed.getInterval()) &&
                modules.pricefeed.getLastUpdateId() >= add(requests[id].atUpdateId, 2)
            )
        )   // PriceFeed Module: Wait at least one interval time and two updates before continuing (unless it is the first investment)
    {
        Request request = requests[id];
        var (isRecent, , ) =
            modules.pricefeed.getPriceInfo(address(request.requestAsset));
        require(isRecent);
        // sharePrice quoted in QUOTE_ASSET and multiplied by 10 ** fundDecimals
        uint costQuantity = toWholeShareUnit(mul(request.shareQuantity, calcSharePriceAndAllocateFees())); // By definition quoteDecimals == fundDecimals
        if (request.requestAsset != address(QUOTE_ASSET)) {
            var (isPriceRecent, invertedRequestAssetPrice, requestAssetDecimal) = modules.pricefeed.getInvertedPriceInfo(request.requestAsset);
            if (!isPriceRecent) {
                revert();
            }
            costQuantity = mul(costQuantity, invertedRequestAssetPrice) / 10 ** requestAssetDecimal;
        }
        if (
            isInvestAllowed[request.requestAsset] &&
            costQuantity <= request.giveQuantity
        ) {
            request.status = RequestStatus.executed;
            require(AssetInterface(request.requestAsset).transferFrom(request.participant, address(this), costQuantity)); // Allocate Value
            createShares(request.participant, request.shareQuantity); // Accounting
            if (!isInAssetList[request.requestAsset]) {
                ownedAssets.push(request.requestAsset);
                isInAssetList[request.requestAsset] = true;
            }
        } else {
            revert(); // Invalid Request or invalid giveQuantity / receiveQuantity
        }
    }
}