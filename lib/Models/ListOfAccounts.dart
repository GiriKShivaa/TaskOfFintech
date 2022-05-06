

import 'dart:convert';

ListOfAccountData listOfAccountDataFromJson(String str) => ListOfAccountData.fromJson(json.decode(str));

String listOfAccountDataToJson(ListOfAccountData data) => json.encode(data.toJson());

class ListOfAccountData {
    ListOfAccountData({
        required this.data,
    });

    Data data;

    factory ListOfAccountData.fromJson(Map<String, dynamic> json) => ListOfAccountData(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.accounts,
        required this.address,
        required this.creditScore,
       required this.email,
       required this.mobile,
       required this.name,
        required this.pan,
        required this.totalNumberOfAccounts,
    });

    List<Account> accounts;
    String address;
    int creditScore;
    String email;
    String mobile;
    String name;
    String pan;
    int totalNumberOfAccounts;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        accounts: List<Account>.from(json["accounts"].map((x) => Account.fromJson(x))),
        address: json["address"],
        creditScore: json["credit_score"],
        email: json["email"],
        mobile: json["mobile"],
        name: json["name"],
        pan: json["pan"],
        totalNumberOfAccounts: json["total_number_of_accounts"],
    );

    Map<String, dynamic> toJson() => {
        "accounts": List<dynamic>.from(accounts.map((x) => x.toJson())),
        "address": address,
        "credit_score": creditScore,
        "email": email,
        "mobile": mobile,
        "name": name,
        "pan": pan,
        "total_number_of_accounts": totalNumberOfAccounts,
    };
}

class Account {
    Account({
       required this.accountNo,
        required this.amountOverdue,
        required this.currentBalance,
       required this.dateOpened,
       required this.dateReported,
        required this.lender,
        required this.sanctionAmount,
       required this.type,
    });

    String accountNo;
    String amountOverdue;
    String currentBalance;
    String dateOpened;
    String dateReported;
    String lender;
    String sanctionAmount;
    String type;

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        accountNo: json["account_no"],
        amountOverdue: json["amount_overdue"],
        currentBalance: json["current_balance"],
        dateOpened: json["date_opened"],
        dateReported: json["date_reported"],
        lender: json["lender"],
        sanctionAmount: json["sanction_amount"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "account_no": accountNo,
        "amount_overdue": amountOverdue,
        "current_balance": currentBalance,
        "date_opened": dateOpened,
        "date_reported": dateReported,
        "lender": lender,
        "sanction_amount": sanctionAmount,
        "type": type,
    };
}
