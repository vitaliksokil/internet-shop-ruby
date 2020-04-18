class OrderNotifierMailer < ApplicationMailer
  default from: 'Sam Ruby <depot@example.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.received.subject
  #
  def received(order)
    @order = order
    @line_items = LineItem.where(['order_id = ?',order.id])
    mail to: order.email, subject:'Подтверждение заказа в Music Shop'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.shipped.subject
  #
  def shipped(order)
    @order = order
    @line_items = LineItem.where(['order_id = ?',order.id])

    mail to: order.email, subject: 'Заказ из Music Shop отправлен'
  end
end
