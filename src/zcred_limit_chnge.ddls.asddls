@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Credit Limit Change'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCRED_LIMIT_CHNGE with parameters p_user: abap.char(12) as select from I_SalesOrder
association to I_SalesOrder as _so on _so.SalesOrder = $projection.MaxSalesOrder
{
    key SoldToParty,
        max(SalesOrder) as MaxSalesOrder,
        _so
}
where SoldToParty = $parameters.p_user
group by
    SoldToParty

