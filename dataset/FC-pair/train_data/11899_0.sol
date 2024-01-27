contract c11899{
    /* Publish article */
    function publish(string articleHash, bytes32 keyHash, uint256 numTokens) {
        if (msg.sender != publishingOwner) {
            PublishResult(1);
            throw;
        } else if (numTokens > maxTokensPerArticle) {
            PublishResult(2);
            throw;
        } else if (block.timestamp - timeOfLastPublish < minSecondsBetweenPublishing) {
            PublishResult(3);
            throw;
        } else if (articleKeyHashRegister[articleHash] != 0) {
            PublishResult(4);  //can't republish same article
            throw;
        }
        timeOfLastPublish = block.timestamp;
        publishedRegister[numArticlesPublished] = articleHash;
        articleKeyHashRegister[articleHash] = keyHash;
        numArticlesPublished++;
        remainingTokensForArticle[articleHash] = numTokens;
        PublishResult(3);
    }
}