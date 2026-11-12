Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524688;
	b=ITMPI/W/+g1NHR5ndyScydxE5L+ycax1wUt6FNSEUvzunWynXZZIeQnhGyo30Wk0mQ8d
	 kjeptbcciISHYAJ47XauFKMFh2IayB0miftRFiKD6aSpRgZyaI2JBsb9R16DnjOVDcy34
	 e/Q5F90YDUUrfjzFyuIXeqehZGdDAO8lfj9ron98SjE4hrdK7r1FAapk8rWZhRGmVrrRZ
	 L8sC/8/idax52iOQcBVEWCW2JXE/yXSJioAURt252fLRe/kQXX/eqY4XSA2QRhSXkJ4bK
	 cDK6gsD5GRZLbnVBq0wCsPXgJs0XyChy1Otu6vu7bKNQBgm8zB7YZUUYGzVkwl7hOBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=h/4ZmNZSkN5127BfeP/7xUQIBc4JFqpmLA7VTI9WLuY=;
	b=jeSGJP/nTJakqeCgUg0SJ1u5yGHcZRPtIjRE7Nii1kAnQc7UHTHRwlZSF7dMNfwbMt7j
	 WmLMlUdoa1cPO8El4oN3Ao4Y6SHjoIkIK71DmxTuNQOF7h6PZBm4g57cTpXKTcBu3U3t+
	 TOiMkgWa0S6VqtCdhjb/VupQNpItL1vfy/tVmMK+U4z7/G3zYuxGJwP1USYsXsk1uddol
	 d8lY1Ae6sqMXd1Bmhy0YbcQd1EfmzgmHIHl2m2Fu256QPj8ZSNTgzAid1E4g5IICC7Dad
	 wNyueI2TXMLxN64tWoP7XVcOa8rS7MUkKbtb1T7X+JxB42h/lkUPEyIYXXt+uUfB04w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=oaqjexM0;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D052606A8B5
	for <printk@lists.linux.dev>; Thu, 12 Nov 2026 23:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D052606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=oaqjexM0
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e3b22e971so126793f8f.0
        for <printk@lists.linux.dev>; Thu, 12 Nov 2026 15:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794524687; x=1795129487; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/4ZmNZSkN5127BfeP/7xUQIBc4JFqpmLA7VTI9WLuY=;
        b=oaqjexM0FYzwkCNnXDm0fhpUiNsCJdJSxOe9NvOIZd+eMrkMvgXa/HMOrb16qow03B
         LyrlnIbzSmZMkkyOn2EHaA43uIz5aiYE2AjdFhdxdRWojfH63Tg8e8k46wMrhzqsiVUo
         t/tdZ+oI/EBqvnvTxOWAoWYn76onyUUJoPLEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524687; x=1795129487;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/4ZmNZSkN5127BfeP/7xUQIBc4JFqpmLA7VTI9WLuY=;
        b=pMmA5VVCCA8dzACvYVGB5b+vtLbdrw41YDmLm8WIVplfmOoU8ZY1tDNN2IZtHX8C+E
         g7TDJk39EzqhdA2gaVke6Rxe9yoTqIF5/Y+I5kj0W/tzM+7nF+vNVgoZ70GST6xfoqlc
         tV1GYN/dC0OhRCZwpmIX9h4UHyuSTlIeQ1OgH7D5FarYoV3PqMb28LH9IoWt+1xCQVOQ
         LAYQ6zGffljTRK62Xid6BldTdFBdIe8f9GWvyXUZ9Ac2dt1a+Nyz8ta9iStEA4RsUEz0
         rC1UP21uyjIzW40TbAPs61suQ53KQ43d+8i1fjftXFGlMG81L0J2tiPQVhuleErZ7+jO
         3bEw==
X-Forwarded-Encrypted: i=1; AL+hErGLtAjHD/bh86RQ0x6kPcLLnQnpfhISr/A+3xRpS1/yDo87TLLp3rRkK/wC78X7qyzZlBHX8fw=@lists.linux.dev
X-Gm-Message-State: APuU4Z/gvBhUhVY6nS0zWv2veMb4WRafZd4iurIobFuRl2JsVbLW43Fw
	oqBSo7Z2+R38B5LRDh0GurlUuU8a5R+9tdspZn4W1DQDbDrhg4JI7RpuBrrvZ9a2Ch4=
X-Gm-Gg: AYBFou08IMWH2GT6Jrr++uN7XIB9klxaoBt3k6OFpY45AXVxVxQFubXOaMGmKpXUAwu
	U/6Coen6QwEQRFLTZ1dkSUDU5BfovtWJ+oxP8fL1iYaLN9uuYQ53q6UnqaEtyaMZGsldU0dQ5y4
	WjwKAZxcE/aJvxLy5qEXvuNNQATf2cCeUuBb9vGLJqXEUpAHXc3f2z3W7vpeo+Zr0HucM8OR995
	PyWI7hKw+1Et7Oa+86jyISUA9CL6JxztivKoFvIiRxGN6eUtB2uBJl4byk4BXaaMcOa9twivn0F
	LCfpek4GRS7jhajPD3Pz8dChXtuPkqx+hIWxn+hH4mbZs/aXGbfTqf72sF5E7YlRx/ZOXHP89eU
	AzWAHibrCFAkcg+9vkV6Gf6mlY9MeLQiZV/QuiiKz6hHWbVtwHaWlAuZiuX7wpzbopr9y4E2LnH
	bqOUshdTfB89VGSt9aOoG9TyyCnLZ9YYP4x/K81jfmPTwfGqoXanH2fYBe3QkR4NgPPHG0VOPA2
	e0YtslcG5Up1PQiNmWEVCgwS8IJauvnhhXbsHEJRC13/hvVDdDzTqhmim7JR8EaoFqn4FPpduwZ
	F05nyccPXPtxY4Q2uCszzdMGhFd/YGyb2N2EXZ/a+KolGxzT3qyARhLHQ0IgDiNAQXnzpXVrN13
	YaRIYi4k29yf8XUwzcvpTfz6FaRdDFJ2vjVYnOfnzQgD961qrKru4xwiDb77BtyAqv9vpT8ec40
	xAOaAcaQiy9EXBDlwQ3uwdOrMMDjll5vHk6wqdmDmQ0/yYfeQV1qf0lWSBrg==
X-Received: by 2002:a05:6000:3102:b0:48e:4300:c6d4 with SMTP id ffacd0b85a97d-49c747700e5mr1949772f8f.53.1794524686961;
        Thu, 12 Nov 2026 15:04:46 -0800 (PST)
Received: from [172.18.0.2] ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da0a03sm1356260f8f.53.2026.11.12.15.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:04:46 -0800 (PST)
Date: Thu, 12 Nov 2026 15:04:41 -0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 07/17] printk: Check that index is not defined when a console is preferred via devname
In-Reply-To: <20261111154816.71103-8-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com> <20261111154816.71103-8-pmladek@suse.com>
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
Message-ID: <20261112150441.4fbbb20509665746@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Petr,

Petr Mladek writes:
>- *   2. Either @name OR @devname are allowed. [*]
>+ *   2. Either @name and valid @idx OR @devname and @idx=-1 are allowed. [*]

The check below now rejects only idx >= 0 for @devname, so this could say
"negative @idx" instead of "@idx=-1" to match it.

With that (fine to do when applying):

Reviewed-by: Chris Down <chris@chrisdown.name>

Chris
