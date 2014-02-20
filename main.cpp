#include <QCoreApplication>
#include "qtxb.h"
#include <QtSerialPort/QSerialPort>
#include <QTime>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    QSerialPort *serial = new QSerialPort();
    serial->setPortName("/dev/ttyO1");

    QTXB *xb = new QTXB(serial);
    QObject::connect(xb, SIGNAL(receivedATCommandResponse(ATCommandResponse*)), xb, SLOT(displayATCommandResponse(ATCommandResponse*)));
    QObject::connect(xb, SIGNAL(receivedModemStatus(ModemStatus*)), xb, SLOT(displayModemStatus(ModemStatus*)));
    QObject::connect(xb, SIGNAL(receivedTransmitStatus(TransmitStatus*)), xb, SLOT(displayTransmitStatus(TransmitStatus*)));
    QObject::connect(xb, SIGNAL(receivedRXIndicator(RXIndicator*)), xb, SLOT(displayRXIndicator(RXIndicator*)));
    QObject::connect(xb, SIGNAL(receivedRXIndicatorExplicit(RXIndicatorExplicit*)), xb, SLOT(displayRXIndicatorExplicit(RXIndicatorExplicit*)));
    QObject::connect(xb, SIGNAL(receivedNodeIdentificationIndicator(NodeIdentificationIndicator*)), xb, SLOT(displayNodeIdentificationIndicator(NodeIdentificationIndicator*)));
    QObject::connect(xb, SIGNAL(receivedRemoteCommandResponse(RemoteCommandResponse*)), xb, SLOT(displayRemoteCommandResponse(RemoteCommandResponse*)));

    QByteArray address = QByteArray::fromHex("0013a20040a53581");
    QString data = "Hello World";
    forever{
        xb->broadcast(data);
        QTime dieTime= QTime::currentTime().addMSecs(500);
        while( QTime::currentTime() < dieTime )
            QCoreApplication::processEvents(QEventLoop::AllEvents, 100);
    }
    return a.exec();
}

