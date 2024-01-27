contract c18625{
    /**
     * new art hash info
     */
    function newArt(string _id, string _regReport) public onlyOwner returns (bool) {
        ArtInfo memory info = ArtInfo({idtReport: "", evtReport: "", escReport: "", regReport: _regReport});
        artInfos[_id] = info;
        NewArt(_id);
        return true;
    }
}