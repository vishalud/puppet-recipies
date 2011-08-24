class baseclass { 
        include networking::resolver
}
 
node default { 
        include baseclass
}
