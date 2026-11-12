Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524670;
	b=PMa/WMpGHwpfP1TJCm+TZHjaU4pvzVR8sl+MrzELsBKQ9XtGvmIS0MrP+nt/W+wvKycG
	 bYt8QF1SydDsQKYsi7yf4YAaTo9S8bej3gHLheJUdSaFxNqji3zocjfzFcLV5RmGBv+S8
	 SmlHiqnio26Sdbx5eU2PrBUKZDkJ3ObIo0SO+6/7Yn98p4b7NAExyCTnk8lvVvarOFPiS
	 cUgeNG8B7Akt/Sgbi0CMWFolGdvNUfEBQaEBmwyKPqpYy9of66rlqb+cj6P6Uj/h8iMw2
	 q3qqWTVIY4GCRlCa+NsEfg0N9XDDRpdmUnafuTcRzsZJ+y3QtRu1wku1vVpcYDiA7AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=mDnpyhmjZp7ZSLr9QQCroWr4WLbm7A908FCsyv58FvQ=;
	b=2YSUNdsfAnYJBSZvHJwuYHrXpYEVIM4Powy1iKsxBUnth6d/Pb/yKkwDmXyxP1mMrFnw
	 UmYuTOdUw6P3GarnFqmFTY9IX2gUCVU6kW5VVhZxhudqZMVbeFnkghIRdKwSrJ+6y29GK
	 9hHWK6FMEaQ3wyB4GcnHA9DDU5ex7cg7z5IR1796L74kUHVA3EvGBcINSqe0JgP4KvgGe
	 VmX810trMbzDwJv1WpiJRnRdgYreGD1BO+x8GbDLwBwKO3MlnYJ+2b13IKPJT5oOb1srE
	 YyWMZ36AUScXoOdYX4UzgfDwVK41EDg/YlsfQkfHN+hHG8gdeWGPz1K1To4Q7gNaoNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=BZAXL+ss;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A619F606A321
	for <printk@lists.linux.dev>; Thu, 12 Nov 2026 23:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A619F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=BZAXL+ss
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a210470b49so2367335e9.2
        for <printk@lists.linux.dev>; Thu, 12 Nov 2026 15:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794524668; x=1795129468; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mDnpyhmjZp7ZSLr9QQCroWr4WLbm7A908FCsyv58FvQ=;
        b=BZAXL+ssNvJQdbAakQ4NCqVUTERo/lVf7r7+RNzakP6P7kH7idb2pFkbsCpeqjz7EN
         f2oKHGvqUk0u/opbDtiUmV4+gonIhdCyXukLsvopF+1wTA3j23vXyVpKIY2EMMtw+loB
         301+q7hh31dK4jynz4FYNDWOdz2Honiwb3h4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524668; x=1795129468;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDnpyhmjZp7ZSLr9QQCroWr4WLbm7A908FCsyv58FvQ=;
        b=pxdkjFabJGcwEBzRIPQuadkIsF3qwc2ZY5rOgyuSXzTYN2STCyrU1bh/kzT138NcFM
         A7AVVG3YuM3qPXuJ7aCSk3ku+IhOVJS9bpwRQrSeRd/pOcvO0VAQcGWOS+psxKV2GRX7
         v+teIKeIYk1+ft9NOy/kvAYR+fyclP1TX2BQjBgrqWfzgKfvYC0LYBf0Wx2HGiVtE1MF
         LkFkjhI518awemUh78HOEYsUjj645SpIU3am8P8jc+WdD5MrM91PYNOv+9CFWDbkwCtw
         eJoYrLQIE504dEgC5twSC43ZF974sDtKJqAoUTS5H8gY3ztQeQAxaGDHnzcY0Ym589Ej
         JTkA==
X-Forwarded-Encrypted: i=1; AL+hErGUTWiw00ZRNnYSLUgZLOR10EpWb8Ioq66s0WlJbTzLZmamavrR7Ul412etVq55LelktkZInTM=@lists.linux.dev
X-Gm-Message-State: APuU4Z9RDkvuR8vUToqru3G2z/HaSA7iHBDgvJgXoLMNWyxT8ptW0qgo
	Ejn13+sGzxUjk0n1IqOiDo8WuftwLWjzat1LwmdS9DqCOc0UyG9DY9Ulnlzfy8qKW8M=
X-Gm-Gg: AYBFou1MEN6/vNSYLgiZGO8BjuVTpXrFSdColYiI1Mi9VGMtSA7kBP0914TLMv1QGur
	8R/lDkk4GUzxtxQmGklo5vC/FE6ElWwZ/r1xdq5IvrAWKTydAPTo3cUa/InsXMzv48eL2oILO2G
	55aL787kU9jrLFMaofgMA24mdE6V2eGiEP7GJ1SeWrGNQ7d4AGv7dPzYtyvOz05xYQtTCZGWMfZ
	qxEnJ2x8L4CTewpsDeI8IOdU87JUGbXAlRHIb6F1N9WQvIPCgnMl06FEsEIfG+Ai/cIWupQQcvV
	pzu0xs2kOGwk/ubXVNmOFtUcBiXBBNfht+B0eODxqgp1BY3ySVwWADKUUobk6o29esSBZxjbBLb
	ISI0RQ38QfTh5IEmM0xuMeZs0YjcYV7vaHEuj3E1NmfgvbzgAdJb0GHdgZ4LjSTuumZS2QSlzGK
	+Fs1W2k+2n+SYwW0oGPb069nxzkTuuzhK3SfmCpGeVMU40I+xQ+tq8QWNRlqQv2S+1Y3dFfLm4E
	8F63Xvy0VP3gs4UgkU0kubYzTepxVGiw5yTLdy6TcqaL7p0xkIjFJsv23BOcQsPsvyCscc3hOoO
	vEyLMe2piMCcDrYXLRQl0W1D4IIzmCGnLwOK2W0uwaMpx5YXPNlWc9KHlM6J2DxwJAXkMy5njUh
	xiuxgXfA1R6ko1RQvCexF6wWFZ0rUVLENOUOCxOCOWMN2sRVOSvMD+cE5paXwSHaeFZGMBdQb+z
	5s0paJv64LWPLhsvPFuTG8ooYg5+1JtF5WqOQxQxF8O0VNC7dp1oZYFLyfAA==
X-Received: by 2002:a05:600c:19d2:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4bb55ab27afmr11503785e9.20.1794524668116;
        Thu, 12 Nov 2026 15:04:28 -0800 (PST)
Received: from [172.18.0.2] ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e284339sm92882835e9.5.2026.11.12.15.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:04:27 -0800 (PST)
Date: Thu, 12 Nov 2026 15:04:19 -0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 04/17] printk: Separate code for adding/updating preferred console metadata
In-Reply-To: <20261111154816.71103-5-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com> <20261111154816.71103-5-pmladek@suse.com>
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
Message-ID: <20261112150419.35ac913379dae921@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Petr,

Petr Mladek writes:
>+/**
>+ * add_or_update_preferred_console - Add or update a given entry in
>+ *	the preferred_consoles[] array.
>+ * @i: index of the entry in @preferred_consoles table which should get updated.

kernel-doc picks the block up now, thanks. `scripts/kernel-doc -none -Wall`
still says "No description found for return value of
'add_or_update_preferred_console'" though, because it wants a "Return:" line.
"@preferred_consoles" in the @i line also still reads as a parameter,
maybe preferred_consoles[] would be better?

Fine to fix when applying.

Thanks!

Chris
