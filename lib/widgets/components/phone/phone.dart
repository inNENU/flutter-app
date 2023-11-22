import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:innenu/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'phone.g.dart';

final _logger = Logger('component.phone');

@JsonSerializable()
class PhoneComponent extends StatelessWidget {
  const PhoneComponent(
    this.phoneNumber,
    this.givenName, {
    this.familyName = '',
    this.displayName = '',
    this.homeNumber = '',
    this.hostNumber = '',
    this.workNumber = '',
    this.company = '',
    this.note = '',
    this.state = '',
    this.city = '',
    this.street = '',
    this.postalCode = '',
    this.title = '',
    this.email = '',
    super.key,
  });

  factory PhoneComponent.fromJson(Map<String, dynamic> json) =>
      _$PhoneComponentFromJson(json);

  /// 号码
  @JsonKey(name: 'num')
  final String phoneNumber;

  /// 名字
  @JsonKey(name: 'fName')
  final String givenName;

  /// 姓氏
  @JsonKey(name: 'lName')
  final String familyName;

  /// 工作电话
  @JsonKey(name: 'workNum')
  final String workNumber;

  /// 公司电话
  @JsonKey(name: 'hostNum')
  final String hostNumber;

  /// 住宅电话
  @JsonKey(name: 'homeNum')
  final String homeNumber;

  /// 公司
  @JsonKey(name: 'org')
  final String company;

  /// 备注
  @JsonKey(name: 'remark')
  final String note;

  /// 昵称
  @JsonKey(name: 'nickName')
  final String displayName;

  /// 省份
  @JsonKey(name: 'province')
  final String state;

  /// 城市
  final String city;

  /// 城市
  final String street;

  /// 城市
  final String postalCode;

  /// 城市
  final String title;

  /// 电子邮件
  final String email;

  Map<String, dynamic> toJson() => _$PhoneComponentToJson(this);

  /// 拨打电话
  void _makePhoneCall() {
    final url = 'tel:$phoneNumber';

    canLaunchUrlString(url).then((canLaunch) {
      if (canLaunch) {
        launchUrlString(url);
      } else {
        _logger.warning('Phone: can not make phone call');
      }
    });
  }

  /// 添加联系人
  void _addContact(BuildContext context) {
    showModal<void>(
      context,
      content: '是否要添加联系人$familyName$givenName?',
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('取消'),
        ),
        TextButton(
          onPressed: () {
            checkAndAskPermission(context, 'contact').then((success) {
              if (success) {
                // Insert new contact
                final newContact = Contact()
                  ..name.first = givenName
                  ..phones = [
                    Phone(phoneNumber, label: PhoneLabel.main),
                    if (homeNumber.isNotEmpty)
                      Phone(homeNumber, label: PhoneLabel.home),
                    if (workNumber.isNotEmpty)
                      Phone(workNumber, label: PhoneLabel.work),
                    if (hostNumber.isNotEmpty)
                      Phone(hostNumber, label: PhoneLabel.companyMain),
                  ];

                if (displayName.isNotEmpty) {
                  newContact.displayName = displayName;
                }

                if (familyName.isNotEmpty) {
                  newContact.name.last = familyName;
                }

                if (company.isNotEmpty || title.isNotEmpty) {
                  newContact.organizations = [
                    Organization(company: company, title: title)
                  ];
                }

                if (email.isNotEmpty) {
                  newContact.emails = [Email(email)];
                }

                if (note.isNotEmpty) {
                  newContact.notes = [Note(note)];
                }

                if (state.isNotEmpty ||
                    city.isNotEmpty ||
                    street.isNotEmpty ||
                    postalCode.isNotEmpty) {
                  newContact.addresses = [
                    Address(
                      '',
                      state: state,
                      city: city,
                      street: street,
                      postalCode: postalCode,
                    )
                  ];
                }

                newContact.insert().then((contact) {
                  Navigator.pop(context);
                  showTip(context, content: '添加联系人成功');
                });
              } else {
                showTip(context, content: '授权失败');
              }
            });
          },
          child: const Text('确定'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.phone),
            ),
            Expanded(
              child: Text(
                phoneNumber.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.call),
              onPressed: _makePhoneCall,
            ),
            IconButton(
                icon: const Icon(Icons.contact_phone),
                onPressed: () {
                  _addContact(context);
                }),
          ],
        ),
      );
}
