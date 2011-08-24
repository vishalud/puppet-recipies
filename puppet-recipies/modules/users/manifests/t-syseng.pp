class users::t-syseng inherits users {
        group { "t-syseng":
                ensure => present
        }

        #syseng
        adduser { "vishal.ud": username => "vishal.ud", groupname => "t-syseng", shell => "bash", ensure => present, login => true, key => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6SwgxuufO+y8uU6mPmf+l5F1ImhknNzubFxExTj8PYhlIhMi6Nccvw7i+W/SfSVfjU4q5vxaxsy1WHD7kIYPCIi9ZDS7uX2CsgGFfSHxE3ZEPDz9E7gIntTMCI+xK0iSpS4SVb7a+obsNOwV1PjPFCjcna1c4ofuG//chK1SDOj0hWZsOJE+DrKmSeSBacm2lJvPe0ObO4BUj/dMbFHEv7nIbPZYfhzfU3xycplDJc6ASSHbM3IrjhaUoFwIbjnN8WNThi6KLDxxb1wNHL7C19EV3tvcp5wSHoIsA/e/xXXLyl4BTFRXhO7KijtXwBHMrYGiEFu0PNgKjtA3w+rWAw== vishal.ud@SysEng-Xbox' }

        adduser { "mushir.a": username => "mushir.a", groupname => "t-syseng", shell => "bash", ensure => present, login => true, key =>'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtPBAULLlDZckLQBP4Q40Xkc2nt1Lyst7U1tWbg0umfso+a2UoRjiF/m8qTVL5OHKtMTdU8q7ku58CB71ykHt8v8oxrWzdH0qlmcOGvvlmaaduPnxlpBD+K/HjNVf5K7Okbp9KpNPb5dGbfzwaElpnzhMHrvOY39dnB32zJt+pBoI8ycNHnLOI3S6Xa0ikCe8Xw5aP8hbhEEBYI76wZ9jG2m9H7ybQB+eXgi57PtcnvuARgfmFEFW7Y1MHLkEZKHln2Q8+8XoAeZ73RzRD29Zpg7T92cjZqZmtXsbnO9Cp3JKkAV7TEB/VoLyldFL5I/mkn25PJma+tGID0oJTcEkZw== mushir@SysEng-Xbox' }

        adduser { "anthony.g": username => "anthony.g", groupname => "t-syseng", shell => "bash", ensure => present, login => true, key =>'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA273YqyOKRjC1oCaMtUzi/LZpdNbv+o+BcCN6ZvRcIWjdpYwDO+2WmYMRo+uM2NuQ6gptb61cY9Z6PFDfoJclIBQ8+4SIrGVieJQLI56HymrkhqNt8KAVLmVqe9OABKCn53jnMPyevMzmnJeXl0ugcX8PpppwQvsMbZwBliKB0lffrJVxPZ0W6JQ0KI+bOZ3y1UqwlNkKcQn+9xOtWoH3ce5IMlu59KakqoJBThk507aSab/SdpCInnmDJE/tQhpZubWqr0PADsMI19WzO0xCNXGL9wjnBFxOAhYTHWDbIZYbIGqRWPJmWD2aNFNc3zGkSk45EV3CuH3d0qDGLd66kQ== anthony.g@se-mac-anthony'}
	adduser { "monish.m": username => "monish.m", groupname => "t-syseng", shell => "bash", ensure => present, login => true, key => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA493FtkggUSbAJxMJE6fiGHXcN4gCN+81dqxsPMyTz/P8WRSm+XpE5WywlOixYlOFGMsMmmzelkB/k7MMl0aavRsZkXLAL16a53Kvy4FlcrCk7WlBmR+U8+xhRMSr73xJ5vsSTQ16Y55Ynevnx2c0U6gaOOz1P27BD9su26KJapX7h1i37TLRpVOfYPIlsk2Fa1u/7bGYzPFzEsiVdKTUeycfDs1YIhny1Rt9Bt8XlhGa2y46O4B2LwP3NyywwK+qcZzO/9QvBrPpH3IC05A1lyCVQhadm80LupGAIltkVaCC8iIFdbyfTRqp9GcCee+3N9g3hTbHr0vRQMCspbtNWQ== monish@SysEng-Xbox'}

	adduser { "dilip.p": username => "dilip.p", groupname => "t-syseng", shell => "bash", ensure => present, login => true, key => 'ssh-dss AAAAB3NzaC1kc3MAAACBAIVk5l65w9lQTCQKY0rFBm8J5T6jE9QfLFY2LHBZaElKxttOjGY72emF7hTUf/BNHzUJ+3wIMIgZnqk5qXjzWiwm5EXMQ2KIGOLGvmcfy4p6XJOtP9SCCfpBbDxzMQ5w7huYdJJ5x5w7r9aTFEF46g3715XUoYnG1XcCfYagJWO9AAAAFQDxM9iVPSfpy47hfNCSZ+AedjPJ7QAAAIBZR8g54hjucAnLQi/IslVESl+vIEMMPDG+2hc32KyTXkhFnBrtVzP2z7IV+3RCUYNRLWk+zCq9jrhWWojTsAbXo0u5nburpC6xDXA23eMp47H0MpES7m/5T5pYsq/bAqkKvmiN+kS+s+gmueQ8fxbdFn/ZcF08VNlqX3/LbP1AAgAAAIA7AjMCr7pb3UAR+MreeBpNPT4+ZXclwUot2I89Ooh90CE4JL1Tz16Yk/bBiDImTFr6283fKw4LvHrybJHz6e21DroNV6zrh5ewoe8qZwwin85kJPxrCVcOPGrJN7e3bICyXkmvIvzDNz67jnduN3QxGA8CRQS5oX/+sfaZu3qwew== dilip@SysEng-Xbox' }

	adduser { "imran.s": username => "imran.s", groupname => "t-syseng", shell => "bash", ensure => present, login => true, key => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAuc1pczBWl37ckfgOfI1CitosFSjtlfCnIm1cpK0vJD4NpXID7pQE+3ePLz4YIAWHz8SKOQCpcLAfv+eEoBhpsEAZln7y+HdFXYcyIYUqdLCLtUYPzeLzMZo7/gwCkBxjW0yLnUa8eCniH/p96p2gblAXE3lRQOfY1tbO1WeXSg3DeZR3bH6ctJcLfv8x2KfiQDh5w/o0dk836+SvOFV2ldUzmBllracKQxo46jDEnT3+iR5nouwIHLbCKScFYPVpc8IBMPuDzywfS52pf8+7/yYY5LkHbn0wlxMZxNALWnHOOhEFWKArbagIkHRj4n4KTXEypg1dZNjQgamtVjtfVw== imran@SysEng-Xbox'}     
  }
