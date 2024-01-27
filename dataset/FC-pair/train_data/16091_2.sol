contract c16091{
    //allow the sale to be changed for single deployment
    function updateSale(SaleInterfaceForAllocations _sale) external onlyOwner {
        sale = _sale;
    }
}