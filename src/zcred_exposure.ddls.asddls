@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Credit Exposure for Business Partner'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//Comment Added One
//Comment Added Two R1
define view entity ZCRED_EXPOSURE as select from I_CreditExposureItem
{
    key BusinessPartner,
    @Semantics.amount.currencyCode: 'Currency'
    sum( ExposureAmount ) as TotalAmount,
    Currency
}
group by
    BusinessPartner,
    CreditSegment,
    Currency
