@isTest
public class PhoneUtilityTest{
    @testSetup static void testSetup() {
        insert new Contact( RecordTypeId=Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Recipient').getRecordTypeId(),
                            LastName='TestLastName',
                            MobilePhone='5555555555');
    }
    @isTest private static void updatePhoneFormatTest(){
        //given
        Contact c = [SELECT MobilePhone FROM Contact LIMIT 1];
        PhoneUtility.PhoneParameter parameter = new PhoneUtility.PhoneParameter();
        parameter.objectName = 'Contact';
        parameter.recordId = c.Id;
        parameter.phoneValue = c.MobilePhone;
        parameter.phoneField = 'MobilePhone';
        //if
        Test.startTest();
            PhoneUtility.updatePhoneFormat(new PhoneUtility.PhoneParameter[]{parameter});
        Test.stopTest();
        //then
        system.assertEquals('+1',[SELECT MobilePhone FROM Contact LIMIT 1].MobilePhone.left(2));
    }
}