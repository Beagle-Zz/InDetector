contract c16407{
    /**
    * @dev Fusions cost too much so they are here
    * @return All the fusions (babies) of tokenId
    */
    function queryFusionData(uint _tokenId) public view returns (
        uint256[] fusions,
        bool forFusion,
        uint256 costFusion,
        uint256 adult,
        uint exhausted
        ) {
        return (
        chibies[_tokenId].fusions,
        chibies[_tokenId].forFusion,
        chibies[_tokenId].fusionPrice,
        chibies[_tokenId].adult,
        chibies[_tokenId].exhausted
        );
    }
}