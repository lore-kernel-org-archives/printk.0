Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686684;
	b=A0K9HtlybuLW8sz+Lka/6w76zmdWTqQzDGDQ+VM1nMEh5CQnjhMrMy4vtbOHf6aN0i4G
	 BehQm3cgV1QPcUGLCdaZph45ot4x4uAd4rACv65TnejBRovg5KUJiNuxieFyFS/yarXF2
	 MvgPt1o4cBm4WjorLEq/iHIterU2NYAeEDmr67CwYKEX4x4qbnQt0O128rR3xdC2LCJUs
	 9iEs5CeIi7flmVenX4tr2uFxpIsfr0UhkCVdQpz1ztrPXZz/u6HdnwX6ghP2ea+OYC92k
	 7O/8qpVCYLjAy97IjspEBUTAQHldeBF8hDwO/IyEYTGsLfT0qiwZtG3VcEdDGAMa1TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686684;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=ui+mQBeZjuiXLe6iiFq6l4jBGumd9YivK17br+RnUvE=;
	b=pvPCaifVkiOkmAzM14h382IJQgyYQAAVlcUJcWwJT96TOm5RfMsv3D83m2nFCB6lBDpO
	 pmzoztfRP7bbPwZIQy1RfAghf83KAfv9kE88rynDf9RipYxttYPypaFVo7+ZDmkIoB+Mz
	 g3gfSGYIHcCE0BswS0FGPp+EyLmcrBBft2+IMwDVAP/lszP2mcgkQRphgDdSBNUXx+lcH
	 6PBo81+ULtKbh7K4RZjS6wTV5QfWchtn5PuvtFgvlVZ2rxTY+68bewHpTtW6mVHjkfH86
	 u8HQWuuElMoRolFL9wQ/xNDu8NoahUmg/buP37gQkT4nHew6plrgEiFfM4B+KAmB51g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="sZeHJW9/";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qcwnLsAt;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32FC606A323
	for <printk@lists.linux.dev>; Thu, 26 Nov 2026 09:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32FC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sZeHJW9/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qcwnLsAt
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795686681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ui+mQBeZjuiXLe6iiFq6l4jBGumd9YivK17br+RnUvE=;
	b=sZeHJW9/xzagjXOTRGpO3Smr/hxJdadjl/ZCdmFQ3zPHqSBMDwg0DbkNelnK1WCuD42RO6
	dq8NsGRAIN4fnZlWhIXa6dpJLl3htu5aBqCArK7RwCmkYlWvXNREJmJDx9OGP+TpYU++h3
	harLGKrgogQr2I3M3tfQvmaU7UNOpwi7xfAKr+5fhrlPiBVfXMKnaPwqdcJ1noq1KckBo3
	wNouQnHdajwq3hw7bccQWC5dmZxmRQhzhPO6epdULF8vejfB/yS9bMYTQYo7Ynj5B6t1be
	jLLt+avHHcNnxO3Q3ze/0TqdQNBjQIkuW3x71D5X3caoS3HqN+wxPUOw7S2zyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795686681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ui+mQBeZjuiXLe6iiFq6l4jBGumd9YivK17br+RnUvE=;
	b=qcwnLsAt//oR6mAWhAkdgtyBrXvyrpzLrbSRQsSDnUlNHHTsS4nR0Ws8DnGfia1vRj5YJ1
	UraM1qVsy/n5xXCA==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ryan Roberts <ryan.roberts@arm.com>, Breno Leitao
 <leitao@debian.org>, printk@lists.linux.dev, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v4 3/8] printk: Move unsafe takeover check out of
 console_is_usable()
In-Reply-To: <awW3u4xEwwbQARPl@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-4-john.ogness@linutronix.de>
 <awW3u4xEwwbQARPl@pathway.suse.cz>
Date: Thu, 26 Nov 2026 10:57:20 +0106
Message-ID: <87o6bb7wfb.fsf@jogness.linutronix.de>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-11-24, Petr Mladek <pmladek@suse.com> wrote:
>> @@ -645,11 +639,7 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
>>  			if (!con->write_atomic)
>>  				return false;
>>  
>> -			/*
>> -			 * An unsafe write_atomic() callback is only usable
>> -			 * when unsafe takeovers are allowed.
>> -			 */
>> -			if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !nbcon_allow_unsafe_takeover())
>> +			if (!allow_atomic_unsafe && (flags & CON_NBCON_ATOMIC_UNSAFE))
>
> This is a good example that different people have different mental mode and
> prefers another ordering of the checks ;-)

The reason for the switch was because this function becomes a helper
that operates in 2 modes: with atomic_unsafe, without atomic_unsafe. So
I felt it was appropriate to make the "mode of operation" the primary
component of the condition. But since you suggest to move away from
making this a helper, I will switch it back.

>> --- a/kernel/printk/nbcon.c
>> +++ b/kernel/printk/nbcon.c
>> @@ -1468,7 +1468,7 @@ static bool panic_nbcon_allow_unsafe_takeover;
>>   * This is also used by console_is_usable() to determine if it is allowed to
>>   * call write_atomic() callbacks flagged as unsafe (CON_NBCON_ATOMIC_UNSAFE).
>>   */
>> -bool nbcon_allow_unsafe_takeover(void)
>> +static bool nbcon_allow_unsafe_takeover(void)
>>  {
>>  	return panic_on_this_cpu() && panic_nbcon_allow_unsafe_takeover;
>>  }
>> @@ -1672,11 +1672,24 @@ static void __nbcon_atomic_flush_pending(enum pr_flush_reason reason, u64 stop_s
>>  		if (!(flags & CON_NBCON))
>>  			continue;
>>  
>> -		if (!console_is_usable(con, flags, true))
>> +		/*
>> +		 * Using variant of console_is_usable() to include consoles
>> +		 * with unsafe write_atomic() implementations. They might be
>> +		 * allowed depending on nbcon_allow_unsafe_takeover().
>> +		 */
>> +		if (!nbcon_is_unsafe_usable(con, flags))
>>  			continue;
>
> The above function pretends that an unsafe takeover is enabled.

This series establishes that:

unsafe takeover != unsafe usage

At this point in the series that distinction is not yet possible. I was
attempting to:

- keep patch sizes small
- have as many "no functional changes" steps as possible

I will see what I can do here. It might be easier after following your
suggestions.

>>  		allow_unsafe_takeover = nbcon_allow_unsafe_takeover();
>
> Here we get the information whether it is actually allowed.
>
>> +		/*
>> +		 * Since nbcon_is_unsafe_usable() was used, ensure @con does
>> +		 * not have an unsafe write_atomic() if this context expects
>> +		 * safe printing.
>> +		 */
>> +		if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !allow_unsafe_takeover)
>> +			continue;
>
> Here we duplicate the check from __console_is_usable() using the updated
> information.
>
> It is a bit hairy. It might be better to use the up-to-date
> information in console_is_usable*().
>
> I suggest to rename __console_is_usable() -> console_is_usable_unsafe().
> It would take 4 parameters, including @allow_unsafe_takeover.

Agreed. That is clean and fits the end of the series as well.

John
