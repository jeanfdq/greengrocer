import 'package:flutter/material.dart';
import 'package:greengrocer/config/custom_colors.dart';

class OrderStatus extends StatelessWidget {
  final String status;
  final bool isOverDue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'perparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatus({super.key, required this.status, required this.isOverDue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusStepDot(status: "pedido confimado", isCurrentStatus: true),
        _CustomDividerVertical(),

        // Pagamento negado
        if (currentStatus == 1) ...[
          _StatusStepDot(
            status: 'pagamento negado',
            isCurrentStatus: true,
            backgroudColor: Colors.redAccent,
          ),
        ] else if (isOverDue) ...[
          _StatusStepDot(
            status: 'pagamento pix vencido',
            isCurrentStatus: true,
            backgroudColor: Colors.redAccent,
          ),
        ] else ...[
          _StatusStepDot(status: "pago", isCurrentStatus: currentStatus >= 2),
          _CustomDividerVertical(),
          _StatusStepDot(
            status: "separando",
            isCurrentStatus: currentStatus >= 3,
          ),
          _CustomDividerVertical(),
          _StatusStepDot(
            status: "enviado",
            isCurrentStatus: currentStatus >= 4,
          ),
          _CustomDividerVertical(),
          _StatusStepDot(
            status: "entregue",
            isCurrentStatus: currentStatus == 5,
          ),
        ],
      ],
    );
  }
}

class _StatusStepDot extends StatelessWidget {
  final String status;
  final bool isCurrentStatus;
  final Color? backgroudColor;

  const _StatusStepDot({
    required this.status,
    required this.isCurrentStatus,
    this.backgroudColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dot
        Container(
          height: 20,
          width: 20,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isCurrentStatus
                ? backgroudColor ?? CustomColors.customSwatchColor
                : Colors.transparent,
            border: BoxBorder.all(
              width: 1,
              color: CustomColors.customSwatchColor,
            ),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            size: 15,
            color: isCurrentStatus
                ? Colors.white
                : CustomColors.customSwatchColor,
          ),
        ),

        // Status
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(status, style: TextStyle(fontSize: 12)),
          ),
        ),
      ],
    );
  }
}

class _CustomDividerVertical extends StatelessWidget {
  const _CustomDividerVertical();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 2,
      color: Colors.grey.shade400,
      margin: EdgeInsets.only(left: 10),
    );
  }
}
