@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Credit Segment Data for BP'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCRED_SEG_DATA as select from I_CreditManagementAccount
association [0..1] to ZCRED_EXPOSURE as _CredExposure on _CredExposure.BusinessPartner = $projection.BusinessPartner
                                                     
{
    key BusinessPartner,
    key CreditSegment,
        _BusinessPartner.BusinessPartnerName,
        @Semantics.amount.currencyCode: 'CreditSegmentCurrency'
        CustomerCreditLimitAmount,
        CreditLimitLastChangeDate,
        CreditSegmentCurrency,
        @Semantics.amount.currencyCode: 'CreditSegmentCurrency'
        _CredExposure.TotalAmount as ExposedAmount,
        CreditAccountIsBlocked,
        CreditAccountBlockReason,
        _CreditBlockReason._Text[ Language = $session.system_language ].CrdtAcctBlockReasonDescription as CrdtAcctBlockReasonDescription
}
