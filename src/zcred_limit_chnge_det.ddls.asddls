@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Credit Limit Change Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCRED_LIMIT_CHNGE_DET as select from I_Customer
association[1..1] to ZCRED_LIMIT_CHNGE as _limit on _limit.SoldToParty = $projection.Customer
{
    key Customer,
        _limit(p_user : '0001000003').MaxSalesOrder as LatestSalesOrder,
        _limit(p_user : '0001000003')._so.CreationDate as CreatedOn,
        _limit(p_user : '0001000003')._so.CreatedByUser as CreatedBy
}
