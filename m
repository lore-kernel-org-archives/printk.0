Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524700;
	b=PPefOMkUFL91NLwvJh4EoobEjrsF4BEbT+DE2gpG4YFJh6W+UJvuKkO/aoKlWb6W0eeS
	 j0umlhyUgRbRm05bxUgQcome/eSPUDRwca+xQcWSlPQTR11YfCJVWAzz1nHGc+Oz4znPS
	 rTOaUnLseuSQRCylaAdnxdm8H8eIuCf6JQdG5rlU7AvLGOSYekRZQ+cvYBAuw56y29rv9
	 LEdUA4oERS67SjNmwi/xu1pwq/rWWgmjJ5VWjhLGEu29WPBQ08eJAVZ/KGh+nKjYARVkq
	 tz/ObMAD3YEYHIK//oOTYqQEk0SXnz5UHFIp0NHNxNO5C7anIcA/EAiqb4fP4t0LxkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=p/4lk02epaMR+IsZKZ+HoxMKqUc6qVIda0VOtHn3aEc=;
	b=PKO2rBsdr1KiPTHMjBc4kxGnwkPob8GIcxghFGMLuqAItQl7LnWw2QGq5i5tvLBwjGUR
	 gV1PlSSszGO5O42DP2kqiQb62HxeE3D0mpCEClZTMRDPszDa41vkVaEONFrjZ47jE0SYd
	 l3luw6Q0JVSIl9TRTcAEcnNn81zP5uftErmQJ8C0ix2cNiwcnqTf+cAo/010StOFNpUJM
	 52/Dkv9bcbTHP6P0E3FDhybg/I6hzW0W7rPXN5Rlj5uy4PLzOM5ENIwd0NS6ZylPv+SRm
	 Tp39Hk/yFR21Xi77YUQ9YvDgJS2TQUc8fRKp78dsTWQJ7u3mggpzcpO/Sci/g5W+y/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=XVrIqwTa;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C0D606A33A
	for <printk@lists.linux.dev>; Thu, 12 Nov 2026 23:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73C0D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=XVrIqwTa
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4919a880834so140105f8f.0
        for <printk@lists.linux.dev>; Thu, 12 Nov 2026 15:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794524699; x=1795129499; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/4lk02epaMR+IsZKZ+HoxMKqUc6qVIda0VOtHn3aEc=;
        b=XVrIqwTaplBYtnPjmteoFY1hoSYMQLrcAoest1O9S91Kbso2NDrb0/GwvC9aGyesFY
         UGWDdGxnbDOH9+GOa8giDO9uCxpG5lZ7qoNh51idplWisHbfF+/dsLdwkFFXVKtFzSek
         XVLnx9Hh2/0qPigjBrt8XdnhCNqB7fGbw9n/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524699; x=1795129499;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/4lk02epaMR+IsZKZ+HoxMKqUc6qVIda0VOtHn3aEc=;
        b=Ui+1Y9JL+vq7lUC9cyKm/BrCm2aZHjyOYoS7xd6jRVsqj3sBpR7U5Z4Xr2sC5X5jJi
         xtXTOp+348KQjS4iIS8EjzM0JSfM12KUkzUTNTNR3v/Q4+PupGOc+ujB5VPp1EIo362+
         pemdAb6Uz2u3rt4iwIpDZh1+IrvEBO+FXP5jIN5pgmJgwC0NyllX3SegIYDSCMggNRTn
         nQT2cOydngTpEnMVrcWeiXfDJth3w0hg7O9cB2Da95nh3jRLUaF1f8snOaA+JwtJ3aw3
         lKjFIbKJOlLxgbE7vL3rKKkAHd6SHTyFVeEPH2CusIoRmPQF4RsejVyiqLZgtGggws4a
         A7aA==
X-Forwarded-Encrypted: i=1; AL+hErGwFC4kdwobDYRKbp/F7YT1ejEE4qLXkk/KyXw2BgTa4awKKszIAfNmwS78dMFBunQfntDDZdA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+qansAjAQC2LVHGiCJFPMuH7iJ1IPL5ilSxcj0pGuS1uZtPsJO
	DxuMZ9aRjjj5mxExtmKPM+LMjLMX8zX1Hik+yvYF7YRTOJnDEXIGAsbyL35++e04xrQ=
X-Gm-Gg: AYBFou0AFraf2pOZEgRmE7DqFxOXDElA8uEe3RcSQxDIj6Ko7+wxXIPZxuK+dlZrMSq
	4CnEjJ0JAliTg8knBVI7ZA1a5dhk2C1I1la3Hh/sK8tToHui1F3jMiEfYm/ayHfOuexdTjGMsf6
	2cYVN/JHUdRTgXihm8lxUkl6L02VIDmVyvaCD0SqadmqJ66eFcDsJ3+mHI630/o+0SElNjrR0IH
	zkbmwFwuSWZgeh7qeCqM+lukjUEpMt2pjb8c13w9AYpu7sgopWkwnXoGedOFM9fgzWQiEjHpIB/
	qygKeqQFLnGYj/2FNMYr3bnHaOZ49HIGoIrx3Hx+q+EDxwK5yp3JXehJpd3SxpiWleL/zBKeLVY
	es6w1djJYy5qkuKTd9dOSr8atTzQnYXBgqK7GrlOCddl9AScaT0hKuldmn9fTahh3CflZypMXlQ
	UcXv8mWD7WMJAqTbD8ajm2rSx0YrIrWJB7zVR3aq2TORrZhAZD6LMukWC9j2/AoPEQl3Db8iPOW
	6lPDWi+im4tyJu/AGA9HXK4bP8H+qPi2nA4CFklV5sqYBCa3YN1kxVSpSIPKLCgc964lJtc+9tB
	HR2XU1xGcIrRt7gWWQio6sftDqfZg4glfjJCv8ID5WEVpJdXTmy+JxgxH5opFPanlZtsHwnPNYL
	fK3nfF0D+FlLcVT8j10OfWIBtIZTI2Ckd1qj/gxKMkNyRle7UA5Tx+vZ0L3oMyoomKpro3nhr1p
	GhEV9G22EojiLDdmRB4PsfVm2M9FhJKqqTdkYm5fahTlneTrPsucWhdf1AmQ==
X-Received: by 2002:a05:600c:4e13:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb55a47fabmr14344115e9.12.1794524698997;
        Thu, 12 Nov 2026 15:04:58 -0800 (PST)
Received: from [172.18.0.2] ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm15846805e9.10.2026.11.12.15.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:04:58 -0800 (PST)
Date: Thu, 12 Nov 2026 15:04:53 -0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 14/17] printk: Update Braille options when preferred more times
In-Reply-To: <20261111154816.71103-15-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com> <20261111154816.71103-15-pmladek@suse.com>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261112150453.a18f9d1d0a874e96@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Petr,

Petr Mladek writes:
>Make the behavior consistent and always update pc->brl_options when
>@brl_options are passed and they were not defined yet.

This changes what users get for something like "console=ttyS0
console=brl,ttyS0". Before, ttyS0 stayed a normal console with CON_CONSDEV
and the Braille request was dropped. Now ttyS0 becomes the Braille console
and, with 15/17, tty0 gets enabled as the default console instead. That
fits with Braille always winning in 13/17, but could you say so here like
you did there?

With only this patch applied, that command line also leaves the guest
without a console until 15/17. preferred_dev_console still points at the
ttyS0 entry after it turns into Braille, so tty0 is not enabled as the
default console. ttyS0 itself is only enabled as the Braille console.
That leaves only earlyser0 registered and "Warning: unable to open an
initial console". Going by the code, the base already ends up there for
the reverse order (console=brl,ttyS0 console=ttyS0), and both of these
seem to be fixed in 15/17. So maybe squashing the two is the simplest way
to keep bisect clean.

>+	/*
>+	 * Allow to override normal console with the Braille variant,
>+	 * for example when ttyS0 is preferred via SPCR brl,ttyS0
>+	 * via the command line.
>+	 */
>+	if (brl_options)
>+		braille_update_options(pc, brl_options);

When an existing entry turns into Braille here, it keeps pc->options from
whoever added it first, and braille_register_console() only falls back to
"57600o8" when those are NULL. So the serial options given with the Braille
request are dropped and the result depends on the order. The cflag of
braille_co ends up as:

     console=ttyS1,115200 console=brl,ttyS1,57600  -> B115200
     console=brl,ttyS1,57600 console=ttyS1,115200  -> B57600

Should the options from the Braille request win when the entry switches
over here? Or would you rather leave that for the separate series about
overriding options?

Also, SPCR never adds a "ttyS" entry, it uses "uart", "pl011" and friends.
For "uart", univ8250_console_match() succeeds when
try_enable_braille_console() tries it, so that one ends up as a normal
console anyway. Maybe use a second console= on the command line as the
example. There's also an "and" missing before "brl,ttyS0".

A few changelog typos while you're there: "stored only it is a new entry"
-> "only when it is", "preferred_console[]" -> "preferred_consoles[]" and
".brl->options" -> ".brl_options".

Once those are fixed, please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>

Chris
