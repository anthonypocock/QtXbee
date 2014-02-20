#-------------------------------------------------
#
# Project created by QtCreator 2013-07-26T12:15:45
#
#-------------------------------------------------

QT       += core 

greaterThan(QT_MAJOR_VERSION, 4): QT += serialport


QT       -= gui

TARGET = qtxbtest
CONFIG   += console

greaterThan(QT_MAJOR_VERSION, 4): CONFIG += serialport

CONFIG   -= app_bundle

TEMPLATE = app


SOURCES += main.cpp \
    qtxb.cpp \
    qtxb/digimeshpacket.cpp \
    qtxb/atcommandqueueparam.cpp \
    qtxb/atcommand.cpp \
    qtxb/txrequest.cpp \
    qtxb/txrequestexplicit.cpp \
    qtxb/atcommandremote.cpp \
    qtxb/atcommandresponse.cpp \
    qtxb/modemstatus.cpp \
    qtxb/transmitstatus.cpp \
    qtxb/rxindicator.cpp \
    qtxb/remotecommandrequest.cpp \
    qtxb/rxindicatorexplicit.cpp \
    qtxb/nodeidentificationindicator.cpp \
    qtxb/remotecommandresponse.cpp

HEADERS += \
    qtxb.h \
    qtxb/digimeshpacket.h \
    qtxb/atcommandqueueparam.h \
    qtxb/atcommand.h \
    qtxb/txrequest.h \
    qtxb/txrequestexplicit.h \
    qtxb/atcommandremote.h \
    qtxb/atcommandresponse.h \
    qtxb/modemstatus.h \
    qtxb/transmitstatus.h \
    qtxb/rxindicator.h \
    qtxb/remotecommandrequest.h \
    qtxb/rxindicatorexplicit.h \
    qtxb/nodeidentificationindicator.h \
    qtxb/remotecommandresponse.h

greaterThan(QT_MAJOR_VERSION, 4){

LIBS            += \
                -L/usr/lib \
                -L/usr/local/lib \

} else {

LIBS            += \
                -L/usr/lib \
                -lQtSerialPort \
}

