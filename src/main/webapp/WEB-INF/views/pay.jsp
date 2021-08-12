<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
</head>
<body>
	<!-- 
	1. ��ǰ����, �����, �����ݾ�
	2. ������� ����?
	2.5 �����ϱ�
	https://scorpio-mercury.tistory.com/10, https://hello-gg.tistory.com/58 ����Ʈ ����
	
	������ �ڵ� (�Ϲݰ���): TC0ONETIME
	������ �ĺ��ڵ�: imp32065802
	
	 -->
<script>

    $(function(){
    
    	//@@@@@@ 1�� @@@@@@@
        var IMP = window.IMP; // ��������
        IMP.init('imp32065802'); //������ �ĺ��ڵ� ����
        var msg;
        
        //@@@@@@@@ 2�� @@@@@@@@
        //url���� parameter �������� --> price�� �˱� ���ؼ�
        var getParam = function(key){
            var _parammap = {};
            document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
                function decode(s) {
                    return decodeURIComponent(s.split("+").join(" "));
                }

                _parammap[decode(arguments[1])] = decode(arguments[2]);
            });

            return _parammap[key];
        };
        
		//@@@@@@ 3�� @@@@@@@
            IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'vivipayment',
            amount : getParam("price"),
            buyer_email : '�̸��� �ֱ�',
            buyer_name : '�̸� �ֱ�',
            buyer_tel : '��ȣ �ֱ�',
            buyer_addr : '�ּ� �ֱ�',
            buyer_postcode : '123-456',
            m_redirect_url : 'endPay.jsp'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] �����ܿ��� �������� ��ȸ�� ���� jQuery ajax�� imp_uid �����ϱ�
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error�� �߻����� �ʵ��� �������ּ���
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        uid : rsp.imp_uid,
                        price: rsp.paid_amount
                        //��Ÿ �ʿ��� �����Ͱ� ������ �߰� ����
                    })
                }).done(function(data) {
                    //[2] �������� REST API�� ��������Ȯ�� �� ���񽺷�ƾ�� �������� ���
                    if ( everythings_fine ) {
                        msg = '������ �Ϸ�Ǿ����ϴ�.';
                        msg += '\n����ID : ' + rsp.imp_uid;
                        msg += '\n���� �ŷ�ID : ' + rsp.merchant_uid;
                        msg += '\n���� �ݾ� : ' + rsp.paid_amount;
                        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;

                        alert(msg);
                    } else {
                        //[3] ���� ����� ������ ���� �ʾҽ��ϴ�.
                        //[4] ������ �ݾ��� ��û�� �ݾװ� �޶� ������ �ڵ����ó���Ͽ����ϴ�.
                    }
                });
                //������ �̵��� ������
                location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
            } else {
                msg = '������ �����Ͽ����ϴ�.';
                msg += '�������� : ' + rsp.error_msg;
                //���н� �̵��� ������
                location.href="<%=request.getContextPath()%>/order/payFail";
                alert(msg);
            }
        });

    });
</script>
</body>
</html>