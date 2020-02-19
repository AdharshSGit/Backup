using System;
using System.Collections.Generic;
using System.Net.Sockets;
using System.IO;
using System.Threading;
using System.Text;
using SocketServer;
namespace SocketClient
{
 
    class Program
    {
        static TcpClient socket = new TcpClient();
      
        static byte[] byReceiveBuffer = new byte[16 * 1024];
        static void ReceiveCallBack(IAsyncResult result)
        {

            Socket socket = result.AsyncState as Socket;
            try
            {
                //  byte[] receivedBytes = new byte[1024 * 5000];
                string receivedPath = @"C:/Users/adharsh.s/Desktop/Log/";
                //int receivedBytesLen = info.Socket.Receive(info.Buffer);
                int fileNameLen = BitConverter.ToInt32(byReceiveBuffer, 0);
                string fileName = Encoding.ASCII.GetString(byReceiveBuffer, 4, fileNameLen);
                Console.WriteLine("Client:{0} connected & File {1} sharing started.", socket.RemoteEndPoint, fileName);
                //var charfile = System.Text.Encoding.UTF8.GetString(receivedBytes).ToCharArray();
                BinaryWriter bwrite = new BinaryWriter(File.Open(receivedPath + fileName, FileMode.Append));
                bwrite.Write(byReceiveBuffer, 4 + fileNameLen, fileNameLen);
                Console.WriteLine("File: {0} received & saved at path: {1}", fileName, receivedPath);
                
                
                
                
                socket.BeginReceive(byReceiveBuffer, 0, byReceiveBuffer.Length, SocketFlags.None, new AsyncCallback(ReceiveCallBack), socket);
                bwrite.Close();
                Console.ReadLine();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }



        static void Main(string[] args)
        {
            Console.WriteLine("Press enter to go");
            Console.ReadLine();


            socket.Connect("192.168.112.93", 6503);

            Console.WriteLine("Client");
            Console.ReadLine();
                      
            socket.Client.BeginReceive(byReceiveBuffer, 0, byReceiveBuffer.Length, SocketFlags.None, new AsyncCallback(ReceiveCallBack), socket.Client);

                try
                {
                    {

                    string filePath = @"C:/Users/adharsh.s/Desktop/";
                    //string sender;
                    Console.WriteLine("Enter the file name");
                    string s = Console.ReadLine();
                        byte[] fileNameByte = Encoding.ASCII.GetBytes(s);
                        byte[] fileData = File.ReadAllBytes(filePath + s);
                        byte[] myData = new byte[4 + fileNameByte.Length + fileData.Length];
                        byte[] fileNameLen = BitConverter.GetBytes(fileNameByte.Length);
                        fileNameLen.CopyTo(myData, 0);
                        fileNameByte.CopyTo(myData, 4);
                        fileData.CopyTo(myData, 4 + fileNameByte.Length);
                        socket.Client.Send(myData);
                        Array.Clear(fileData, 0, fileData.Length);
                        Console.WriteLine("File:{0} has been sent.", s);
                    Console.ReadLine();
                    }
                }

                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }
            }



        }
    }
